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

  componentDidMount() {
    if (this.state.dropzone) initDropzone()
  }

  render() {
    const {url, type, data, dropzone, authenticityToken} = this.state
    return (
      <form action={url} className={dropzone ? "dropzone dz-clickable" : ""} id={dropzone ? "app_dropzone" : ""} method={type}>
        <input type="hidden" name="authenticity_token" value={authenticityToken} />
      </form>
    )
  }
}