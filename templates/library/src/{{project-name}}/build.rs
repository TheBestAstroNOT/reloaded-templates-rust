fn main() {
    // Build time scripts go here. If you have nothing to do here, you can remove this file.
{% if build_csharp_libs -%}
    csbindgen::Builder::default()
        .input_extern_file("src/exports.rs")
        .csharp_dll_name("{{crate_name}}")
        .csharp_class_accessibility("public")
        .csharp_namespace("{{crate_name}}.Net.Sys")
        .generate_csharp_file("../bindings/csharp/NativeMethods.g.cs")
        .unwrap();
{% endif %}
}
