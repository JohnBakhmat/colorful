import gleam/io
import gleam/int
import gleam/string
import gleam/list
import gleam/result

pub fn main() {
  io.println("Hello from colorful!")
}

pub type ColorfulError {
  OutOfRangeError
}

pub fn rgb_to_hex(r: Int, g: Int, b: Int) {
  let validate = fn(x: Int) {
    case x >= 0 && x <= 255 {
      True -> Ok(x)
      False -> Error("Input should be in range between 0 and 255")
    }
  }

  use r <- result.try(validate(r))
  use g <- result.try(validate(g))
  use b <- result.try(validate(b))

  [r, g, b]
  |> list.fold("#", fn(acc, x) {
    acc <> string.pad_left(int.to_base16(x), 2, "0")
  })
  |> Ok()
}
