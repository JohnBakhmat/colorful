import gleam/io
import gleam/int
import gleam/string
import gleam/list
import gleam/result

pub fn main() {
  io.println("Hello from colorful!")
}

fn rgb_to_hex_validate(x: Int) {
  case x >= 0 && x <= 255 {
    True -> Ok(x)
    False -> Error("Input should be in range between 0 and 255")
  }
}

pub fn rgb_to_hex(r: Int, g: Int, b: Int) -> Result(String, String) {
  [r, g, b]
  |> list.map(rgb_to_hex_validate)
  |> result.all()
  |> result.map(fn(arr) {
    arr
    |> list.map(fn(x) { string.pad_left(int.to_base16(x), 2, "0") })
    |> list.fold("#", fn(acc, x) { acc <> x })
  })
}
