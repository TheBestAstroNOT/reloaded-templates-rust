#![doc = include_str!("../README.MD")]
{%- if no-std-by-default %}
#![no_std]
{%- endif %}
{%- if std-by-default %}
#![no_std]
#[cfg(feature = "std")]
extern crate std;
{%- endif %}
{%- if build_c_libs %}
#[cfg(feature = "c-exports")]
pub mod exports;
{%- endif %}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
