let license = variable::get("license");

while switch license.to_upper() 
{
  "APACHE 2.0" => {
    file::rename("LICENSE-APACHE", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-MIT");
    false
  },
  "MIT" => {
    file::rename("LICENSE-MIT", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-APACHE");
    false
  },
  "LGPL V3" => {
    file::rename("LICENSE-LGPL3", "LICENSE");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  "GPL V3" => {
    file::rename("LICENSE-GPL3", "LICENSE");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-GPL3-R");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  "GPL V3 (WITH RELOADED FAQ)" => {
    file::rename("LICENSE-GPL3-R", "LICENSE");
    file::delete("LICENSE-LGPL3");
    file::delete("LICENSE-GPL3");
    file::delete("LICENSE-MIT");
    file::delete("LICENSE-APACHE");
    false
  },
  _ => true,
} {
  license = variable::prompt("What license to use?", "GPL v3 (with Reloaded FAQ)", [
    "GPL v3 (with Reloaded FAQ)",
    "GPL v3",    
    "LGPL v3",
    "Apache 2.0",
    "MIT",
  ]);
}

variable::set("license", license);

// Handling no_std support
let no_std_support = variable::get("no_std_support");
while switch no_std_support 
{
  "STD" => {
    variable::set("std", "true");
    variable::set("no_std-by-default", "false");
    variable::set("std-by-default", "false");
    false
  },
  "NO_STD BY DEFAULT (INCOMPATIBLE WITH C EXPORTS)" => {
    variable::set("std", "false");
    variable::set("no_std-by-default", "true");
    variable::set("std-by-default", "false");
    false
  },
  "STD BY DEFAULT (VIA STD FEATURE)" => {
    variable::set("std", "false");
    variable::set("no_std-by-default", "false");
    variable::set("std-by-default", "true");
    false
  },
  _ => true,
} {
  no_std_support = variable::prompt("Do you need no_std support?", "STD", [
    "STD",
    "STD BY DEFAULT (VIA STD FEATURE)",
    "NO_STD BY DEFAULT (INCOMPATIBLE WITH C EXPORTS)",
  ]);
}

variable::set("no_std_support", no_std_support);
