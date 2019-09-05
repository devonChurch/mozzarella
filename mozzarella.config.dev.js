// Environment specific configuration that is injected into the build when required.
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// This allows our application builds to stay environment agnostic and augment
// itself at run time based on these environment properties.

window._MOZZARELLA_CONFIG_ = {
  environment: "development",
  endpoint: "https://endpoint.development/v1/"
};
