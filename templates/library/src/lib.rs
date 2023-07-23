//! # Some Cool Reloaded Library
//! Here's the crate documentation.

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
