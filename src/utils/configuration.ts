import cloneDeep from "lodash.clonedeep";

// Ingest the external environment configuration (referenced against the `window`)
// and hold it internally. We then remove the original `window` reference and
// freeze our new references so that there are no mutations during the application
// lifecycle =)

const testConfig = { environment: 'test', endpoint: "https://endpoint.test/v1/"}; // prettier-ignore
const externalConfig = window._MOZZARELLA_CONFIG_ || testConfig;
const internalConfig = cloneDeep(externalConfig);

delete window._MOZZARELLA_CONFIG_;
Object.freeze(internalConfig);

export default internalConfig;
