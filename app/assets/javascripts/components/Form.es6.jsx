class Form extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      url: this.props.url || "",
      type: this.props.type || "",
      data: this.props.data || "",
      authenticityToken: this.props.authenticityToken || "",
      dropzone: this.props.dropzone || false
    }
  }

  componentWillMount() {
    if (this.state.dropzone) this.initDropzone.bind(this)
  }

  initDropzone() {
    Dropzone.options.appDropzone = {
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      maxFiles: 1,
      acceptedFiles: "image/*",
      success: function(file, res) {

      }
    }
  }

  render() {
    const {url, type, data, dropzone, authenticityToken} = this.state
    return (
      <div className="row">
        <form action={url} className={dropzone ? "dropzone dz-clickable" : ""} id={dropzone ? "app_dropzone" : ""} method={type}>
          <input type="hidden" name="authenticity_token" value={authenticityToken} />
        </form>
      </div>
    )
  }
}