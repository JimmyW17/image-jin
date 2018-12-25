function initHome() {
  $(document).ready(function() {
    setDropzone();
  })
}

function setDropzone() {
  Dropzone.options.homeDropzone = {
    paramName: "file", // The name that will be used to transfer the file
    maxFilesize: 10, // MB
    maxFiles: 1,
    acceptedFiles: "image/*"
  };
}