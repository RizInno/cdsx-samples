# Rizing CDSX Sample

The CAP project in this repository is used to showcase the basic set up in using the **Rizing CDSX** ([@rizing/cds-extension](https://www.npmjs.com/package/@rizing/cds-extension)) module.

## INTRODUCTION

The CAP project demostrate how **CDSX** can be used to enable easy consumption of an external service such as SAP standard OData API service from S/4HANA on-premise system. The OData API used in this sample project is `API_BUSINESS_PARTNER`. The project can be run using mock data or connected to a live S/4HANA system. Just note that this project was tested on S/4HANA on-premise 2021 FPS 02 and using VS Code IDE.

## GETTING STARTED

- Install dependencies (one-time set up)

```shell
> npm install
```

- Run the app with mocked external service

```shell
> cds watch
```

- Run the app connected to a live S/4HANA on-premise system

```shell
> cds watch --profile backend
```

> **NOTE**: To use the `backend` profile, you need to set up the environment variables by creating a `.env` file and placing it at the root of this project directory. Use the template is provided below.

```properties
s4h_hostname=<s4hana-hostname>
s4h_username=<username>
s4h_password=<password>
```

## LICENSE

This project is licensed under the MIT License.  See [LICENSE](LICENSE) file.
