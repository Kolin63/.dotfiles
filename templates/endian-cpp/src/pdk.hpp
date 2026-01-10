namespace pdk {

/*

Define any structs or classes here that you can use to pass data from the
plugin to the engine.

EXAMPLE:

// The result of counting vowels on the Vowels input.
struct VowelReport {
  // The set of vowels used to get the count, e.g. "aAeEiIoOuU"
  std::string vowels;
  // The count of vowels for input string.
  int32_t count;
  // The cumulative amount of vowels counted, if this keeps state across
  // multiple function calls.
  std::optional<int32_t> total;
};

*/

// host function errors
enum class Error { extism, host_null, not_json, json_null, not_implemented };

}  // namespace pdk

namespace impl {

/*

Define your functions here. These will be exposed to the engine.

After defining a function here, add it to the exports in pdk.cpp. Then, write
the function's source code in src/impl.cpp (or whatever file you want).

EXAMPLE:

std::expected<pdk::VowelReport, pdk::Error> CountVowels(std::string &&input);

*/

}  // namespace impl
