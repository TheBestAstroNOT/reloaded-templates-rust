//! # Some Cool Reloaded Library
//! Here's the crate documentation.
{%- if no-std-by-default %}
#![cfg_attr(not(test), no_std)]
{%- endif %}
{%- if std-by-default %}
#![cfg_attr(not(feature = "std"), no_std)]
{%- endif %}
{%- if build-c-libs %}
pub mod exports;
{%- endif %}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
