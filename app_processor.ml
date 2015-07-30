type applicant = { timestamp: string;
    fname: string;
    lname: string;
    email: string;
    major: string;
    minor: string;
    standing: string;
    cs_classes: string list;
    hours_desired: string;
    work_study: string;
    course_sels: (string * string) list;
    job_sels: (string * string) list;
    cs_grades: (string * string) list;
    langs_skills: (string * string) list;
    availability: string;
    prior: string;
    expl: string;
  };;

let courses = [ "CSE/IT 101"; "CSE/IT 107"; "CSE/IT 113"; "CSE/IT 122";
                  "CSE 213"; "CSE 221"; "CSE 222" ];;
let courses' = List.combine courses 
                [ "CSE_IT_101"; "CSE_IT_107"; "CSE_IT_113"; "CSE_IT_122";
                  "CSE_213"; "CSE_221"; "CSE_222" ];;
let jobs = ["Grader"; "TA"; "Tutor"];;
let concepts = [ "Python Programming"; "C Programming"; "Java Programming";
                   "Data Structures/Algorithms"; "Pointers"; "Linked Lists";
                   "gdb/valgrind"];;

let applicant_of_row r =
  (* timestamp = CalendarLib.Printer.Calendar.from_fstring "%m/%d/%Y %H:%M:%S" (List.assoc "Timestamp" r)*)
  let classes =
    List.assoc "Which of the following CS courses have you already taken?" r
    |> Csv.of_string
    |> Csv.input_all
    |> List.hd
  in
  let prefs = List.map (fun c -> List.assoc ("Course Selection [" ^ c ^ "]") r) courses in
  let sels = List.map (fun j -> List.assoc ("What job positions are you interested in? [" ^ j ^ "]") r) jobs in
  let grades = List.map (fun c -> List.assoc ("Course Grade [" ^ c ^ "]") r) courses in
  let skills = List.map (fun c -> List.assoc ("Language/Concept Proficiency [" ^ c ^ "]") r) concepts
  in
  { timestamp = List.assoc "Timestamp" r;
    fname = List.assoc "First Name" r;
    lname = List.assoc "Last Name" r;
    email = List.assoc "NMT Email Address" r;
    major = List.assoc "What is your major?" r;
    minor = List.assoc "What is your minor?" r;
    standing = List.assoc "Class Standing in Fall 2015 (by credits)" r;
    cs_classes = classes;
    hours_desired = List.assoc "Number of Hours Desired" r;
    work_study = List.assoc "Do you have work study?" r;
    course_sels = List.combine courses prefs;
    job_sels = List.combine jobs sels;
    cs_grades = List.combine courses grades;
    langs_skills = List.combine concepts skills;
    availability = List.assoc "Which of the Following times are you available" r;
    prior = List.assoc "Have you worked for the cs department before?" r;
    expl = List.assoc "If you answered yes to the previous question, please explain." r; };;

let html_of_applicant ?(needtable=false) appl =
  let minor =
    match String.lowercase appl.minor with
    | "n/a" | "nothing" | "" | "-" -> "-"
    | _ -> appl.minor in
  let classes = List.map (fun c ->
    <:html<
      <li>$str:c$</li>
    >> ) appl.cs_classes in
  let c_sels = List.map (fun c -> <:html< <li>$str:c$ - $str:List.assoc c appl.course_sels$</li> >> ) courses  in
  let j_sels = List.map (fun j -> <:html< <tr> <td>$str:j$</td> <td>$str:List.assoc j appl.job_sels$</td> </tr> >> ) jobs  in
  let grades = List.map (fun c -> <:html< <tr> <td>$str:c$</td> <td>$str:List.assoc c appl.cs_grades$</td> </tr> >> ) courses in
  let skills = List.map (fun c -> <:html< <tr> <td>$str:c$</td> <td>$str:List.assoc c appl.langs_skills$</td> </tr> >> ) concepts in
  let aname = (appl.lname) ^ "," ^ (appl.fname) in
  let rval : Cow.Html.t = <:html<
    <a name="$str:aname$" />
    <h1><a href="#top"> ^ Back to top </a></h1>
    <table class="applicant">
      <tr>
        <th>Timestamp</th>
        <td>$str:appl.timestamp$</td>
      </tr>
      <tr>
        <th>Name</th>
        <td>$str:appl.lname$, $str:appl.fname$</td>
      </tr>
      <tr>
        <th>NMT Email Address</th>
        <td>$str:appl.email$</td>
      </tr>
      <tr>
        <th>Major / Minor</th>
        <td>$str:appl.major$ / $str:minor$</td>
      </tr>
      <tr>
        <th>Standing</th>
        <td>$str:appl.standing$</td>
      </tr>
      <tr>
        <th>CS Classes Completed</th>
        <td>
          <ul>$list:classes$</ul>
        </td>
      </tr>
      <tr>
        <th>Hours Requested</th>
        <td>$str:appl.hours_desired$</td>
      </tr>
      <tr>
        <th>Work Study</th>
        <td>$str:appl.work_study$</td>
      </tr>
      <tr>
        <th>Course Selections</th>
        <td>
          <table>$list:c_sels$</table>
        </td>
      </tr>
      <tr>
        <th>Job Selections</th>
        <td>
          <table>$list:j_sels$</table>
        </td>
      </tr>
      <tr>
        <th>CS Course Grades</th>
        <td>
          <table>$list:grades$</table>
        </td>
      </tr>
      <tr>
        <th>Programming Languages / CS Skills</th>
        <td>
          <table>$list:skills$</table>
        </td>
      </tr>
      <tr>
        <th>Availability</th>
        <td>$str:appl.availability$</td>
      </tr>
      <tr>
        <th>Prior experience working in the CS Department?</th>
        <td>$str:appl.prior$</td>
      </tr>
      <tr>
        <th>If so, explanation:</th>
        <td>$str:appl.expl$</td>
      </tr>
    </table>
  >> in rval;;

let html_of_application appls =
  let names = List.map (fun appl ->
                  (List.assoc "Last Name" appl),(List.assoc "First Name" appl))
                  appls in
  let links = List.map (fun n ->
                          let lname = (fst n) ^ "," ^ (snd n) in
                          let dname = (fst n) ^ ", " ^ (snd n) in
                          let rv = Cow.Html.of_string ("<li><a href=\"#" ^ lname ^ "\">" ^ dname ^ "</a></li>") in rv)
                  names in
  let applicants = List.map (fun appl -> html_of_applicant @@ applicant_of_row appl) appls in
  let jlinks = List.map (fun j -> Cow.Html.of_string ("<li><a href=\"" ^ j ^ ".html\">" ^ j ^ "</a></li>")) jobs in
  let clinks = List.map
    (fun c ->
      let c' = List.assoc c courses' in
      Cow.Html.of_string ("<li><a href=\"" ^ c' ^ ".html\">" ^ c ^ "</a></li>")) courses in
  let rval = <:html<
    <style>
      table.applicant tr:nth-child(even) {background: #CCC;}
      table.applicant tr:nth-child(odd) {background: #FFF;}

      table.applicant tr tr:nth-child(even) {background: #a0FFa0;}
      table.applicant tr tr:nth-child(odd) {background: #0aFF0a;}
    </style>
    <a name="top"></a>
    <ul>
      $list:links$
    </ul>
    <h2>By job</h2>
    <ul>
      <li><a href="index.html">HOME</a></li>
      $list:jlinks$
    </ul>
    <h2>By class</h2>
    <ul>
      <li><a href="index.html">HOME</a></li>
      $list:clinks$
    </ul>
    $list:applicants$
  >> in rval;;

module List = struct
  include List

  let rec normalize_length ls len def =
    if List.length ls < len
    then normalize_length (ls @ [def]) len def
    else begin
      if List.length ls > len
      then begin
        let rec peel_from_front ls n =
          match ls with
          | [] | _ when n = 0 -> []
          | hd :: tl -> hd :: peel_from_front tl (n - 1)
        in peel_from_front ls len
      end
      else ls
    end
end

let () =
  let file_path = ref "" in
  let perms = ref 0o640 in
  let out_path = ref "./output" in
  let usage_message = "app_processor is used to process grader applications in a human-friendly way. Usage:" in
  Arg.parse
    [ "-f", Arg.Set_string(file_path), "the CSV file to load";
      "-p", Arg.Set_int(perms), "the UNIX permissions to use for the output [deprecated]";
      "-o", Arg.Set_string(out_path), "the directory in which to store the output files"; ]
    print_endline
    usage_message;
  if !file_path = ""
  then raise (Failure "Argument -f is required!")
  else begin
    (*Unix.mkdir !out_path !perms;
    Unix.chdir !out_path;*)
    let index = open_out (!out_path ^ "/index.html") in
    let file = Csv.load !file_path in
    let keys = List.hd file in
    let klen = List.length keys in
    let vals =
      List.tl file
      |> List.map (fun r -> List.normalize_length r klen "UNKNOWN") in
    let data = List.map (fun r -> List.combine keys r) vals in
    let jobsels_pages =
      List.map
        (fun j ->
          List.filter (fun appl ->
            let appl' = applicant_of_row appl in
            match List.assoc j appl'.job_sels with
            | "Yes" | "Preferred" | "If Needed" -> true
            | _ -> false
          ) data
        ) jobs
      |> List.combine jobs
    in
    List.iter (fun j ->
        let f = open_out (!out_path ^ "/" ^ j ^ ".html") in
        let appl = List.assoc j jobsels_pages in
        output_string f (Cow.Html.to_string @@ html_of_application appl);
        close_out f;
      ) jobs;
    let coursesels_pages =
      List.map
        (fun c ->
          List.filter (fun appl ->
            let appl' = applicant_of_row appl in
            match List.assoc c appl'.course_sels with
            | "Yes" | "Preferred" | "If Needed" -> true
            | _ -> false
          ) data
        ) courses
      |> List.combine courses
    in
    List.iter (fun c ->
        let c' = List.assoc c courses' in
        let f = open_out (!out_path ^ "/" ^ c' ^ ".html") in
        let appl = List.assoc c coursesels_pages in
        output_string f (Cow.Html.to_string @@ html_of_application appl);
        close_out f;
      ) courses;
    output_string index @@ Cow.Html.to_string @@ html_of_application data;
    close_out index;
  end
