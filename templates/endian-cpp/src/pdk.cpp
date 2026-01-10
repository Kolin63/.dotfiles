#define EXTISM_CPP_IMPLEMENTATION
#include "pdk.hpp"

#include <jsoncons/json.hpp>

#include <extism-pdk.hpp>

/*

EXAMPLE:

JSONCONS_N_MEMBER_NAME_TRAITS(pdk::VowelReport, 3, (vowels, "vowels"),
                              (count, "count"), (total, "total"))
*/

namespace pdk {

namespace exports {

/*

EXAMPLE:

int32_t EXTISM_EXPORTED_FUNCTION(CountVowels) {
  auto input = extism::input().string();
  extism::log_debug("CountVowels: calling implementation function");
  auto result = impl::CountVowels(std::move(input));
  if (!result) {
    extism::error_set("CountVowels: failed");
    return -3;
  }
  extism::log_debug("CountVowels: setting JSON output");
  std::string output;
  jsoncons::encode_json(*result, output);
  if (!extism::output<char>(output)) {
    extism::error_set("outputting failed");
    return -5;
  }
  extism::log_debug("CountVowels: returning");
  return 0;
}

*/

}  // namespace exports

namespace imports {}  // namespace imports

}  // namespace pdk
