{
  lib,
  buildPythonPackage,
  fetchPypi,
  llama-index-core,
  llama-index-readers-file,
  poetry-core,
  pythonOlder,
  s3fs,
}:

buildPythonPackage rec {
  pname = "llama-index-readers-s3";
  version = "0.1.9";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    pname = "llama_index_readers_s3";
    inherit version;
    hash = "sha256-ramC3INitu++AHKCWov78ad66/XnZG+Z4bZJHBdN5Uk=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    llama-index-core
    llama-index-readers-file
    s3fs
  ];

  # Tests are only available in the mono repo
  doCheck = false;

  pythonImportsCheck = [ "llama_index.readers.s3" ];

  meta = with lib; {
    description = "LlamaIndex Readers Integration for S3";
    homepage = "https://github.com/run-llama/llama_index/tree/main/llama-index-integrations/readers/llama-index-readers-s3";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
