import gleeunit
import gleeunit/should.{be_error, be_ok, equal}
import colorful.{rgb_to_hex}

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn rgb_to_hex_test() {
  rgb_to_hex(255, 255, 255)
  |> be_ok
  |> equal("#FFFFFF")

  rgb_to_hex(0, 0, 0)
  |> be_ok
  |> equal("#000000")

  rgb_to_hex(0, 0, 255)
  |> be_ok
  |> equal("#0000FF")

  rgb_to_hex(255, 0, 0)
  |> be_ok
  |> equal("#FF0000")

  rgb_to_hex(0, 255, 0)
  |> be_ok
  |> equal("#00FF00")

  rgb_to_hex(25, 71, 42)
  |> be_ok
  |> equal("#19472A")

  rgb_to_hex(-1, 0, 0)
  |> be_error

  rgb_to_hex(0, -1, 0)
  |> be_error

  rgb_to_hex(0, 0, -1)
  |> be_error
}
