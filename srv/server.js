const cds = require("@sap/cds");
const cdsx = require("@rizing/cds-extension");

cds.on("served", services => {
	cdsx.load(services);
});

cds.on("bootstrap", () => {
	cdsx.config();
});