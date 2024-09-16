<div align="center">
  <a href="https://koyeb.com">
    <img src="https://www.koyeb.com/static/images/icons/koyeb.svg" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">Koyeb Serverless Platform</h3>
  <p align="center">
    Deploy vLLM on Koyeb
    <br />
    <a href="https://koyeb.com">Learn more about Koyeb</a>
    ·
    <a href="https://koyeb.com/docs">Explore the documentation</a>
    ·
    <a href="https://koyeb.com/tutorials">Discover our tutorials</a>
  </p>
</div>

## About Koyeb and the vLLM example application

Koyeb is a developer-friendly serverless platform to deploy apps globally. No-ops, servers, or infrastructure management.

This repository is designed to show how to deploy a vLLM instance to Koyeb. The `Dockerfile` allows for configuration through environment variables to make deployment and configuration more straightforward. By default, the image deploys the [`meta-llama/Meta-Llama-3.1-8B-Instruct` image](https://huggingface.co/meta-llama/Meta-Llama-3.1-8B-Instruct), but this is configurable using the `MODEL_NAME` environment variable.

## Getting Started

Follow the steps below to deploy a vLLM instance to your Koyeb account.

### Requirements

To use this repository, you need:

- A Koyeb account to build the `Dockerfile` and deploy it to the platform. If you don't already have an account, you can [sign-up for free](https://app.koyeb.com/auth/signup).
- Access to GPU Instances on Koyeb. [Join the preview today](https://www.koyeb.com/ai) to gain access.
- [Hugging Face](https://huggingface.co/) account with a read-only API token. You will use this to fetch the models that vLLM will run. You may also need to accept the terms and conditions or usage license agreements associated with the models you intend to use. In some cases, you may need to request access to the model from the model owners on Hugging Face. For this guide, make sure you have accepted any terms required for the [meta-llama/Meta-Llama-3.1-8B-Instruct](https://huggingface.co/meta-llama/Meta-Llama-3.1-8B-Instruct).

### Deploy using the Koyeb button

The fastest way to deploy a vLLM instance is to click the **Deploy to Koyeb** button below.

[![Deploy to Koyeb](https://www.koyeb.com/static/images/deploy/button.svg)](https://app.koyeb.com/deploy?name=koyeb-vllm&type=git&repository=koyeb%2Fexample-vllm&branch=main&builder=dockerfile&instance_type=gpu-nvidia-rtx-4000-sff-ada&env%5BHF_TOKEN%5D=CHANGE_ME&ports=8000%3Bhttp%3B%2F)

Clicking on this button brings you to the Koyeb App creation page with most of the settings pre-configured to launch this application. You will need to configure the following environment variables:

- `HF_TOKEN`: Set this to your Hugging Face read-only API token.
- `MODEL_NAME`: Set this to the name of the model you wish to use, as given on the Hugging Face site. You can check [what models vLLM supports](https://docs.vllm.ai/en/latest/models/supported_models.html) to find out more. Click the model name copy icon on the Hugging Face page to copy the appropriate value. If not provided, the `meta-llama/Meta-Llama-3.1-8B-Instruct` model will be deployed.
- `REVISION`: Set this to the model revision you wish to use. You can find available revisions in a drop down menu on the **Files and versions** tab of the Hugging Face model page. If not provided, the default revision for the given model will be deployed.
- `VLLM_API_KEY`: This defines an authorization token that must be provided when querying the API. If not provided, unauthenticated queries will be accepted by the API.

Additionally, open the **Health checks** section and set the **Grace period** to 300 seconds to allow time for vLLM to fetch the model.

_To modify this application example, you will need to fork this repository. Checkout the [fork and deploy](#fork-and-deploy-to-koyeb) instructions._

### Fork and deploy to Koyeb

If you want to customize and enhance this application, you need to fork this repository.

If you used the **Deploy to Koyeb** button, you can simply link your service to your forked repository to be able to push changes. Alternatively, you can manually create the application as described below.

On the [Koyeb Control Panel](https://app.koyeb.com/), on the **Overview** tab, click the **Create Web Service** button to begin.

1. Select **GitHub** as the deployment method.
2. Choose the repository containing your application code.
3. Expand the **Environment variables** section and click **Bulk edit** to configure new environment variables. Paste the following variable definitions in the box:

   ```
   HF_TOKEN=
   MODEL_NAME=
   REVISION=
   VLLM_API_KEY=
   ```

   Fill out the values as described in the previous section.

4. In the **Instance** section, select the **GPU** category and choose **RTX-4000-SFF-ADA**.
5. In the **Health checks** section, set the **Grace period** to 300 seconds. This will provide time for vLLM to download the appropriate model from Hugging Face and initialize the server.
6. Click **Deploy**.

The repository will be pulled, built, and deployed on Koyeb. Once the deployment is complete, it will be accessible using the Koyeb subdomain for your service.

Use the following paths to interact with your instance:

- `/v1/models`: to access the list of models served by the vLLM instance.
- `/v1/completions`: to access the [completions API](https://docs.vllm.ai/en/latest/getting_started/quickstart.html#using-openai-completions-api-with-vllm)
- `/v1/chat/completions`: to access the [chat API](https://docs.vllm.ai/en/latest/getting_started/quickstart.html#using-openai-chat-api-with-vllm)

## Contributing

If you have any questions, ideas or suggestions regarding this application sample, feel free to open an [issue](//github.com/koyeb/example-vllm/issues) or fork this repository and open a [pull request](//github.com/koyeb/example-vllm/pulls).

## Contact

[Koyeb](https://www.koyeb.com) - [@gokoyeb](https://twitter.com/gokoyeb) - [Slack](http://slack.koyeb.com/)
