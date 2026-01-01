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
