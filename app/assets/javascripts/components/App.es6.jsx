class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      dropzone: this.props.dropzone || false,
      formUrl: this.props.form_url || "",
      formMethod: this.props.form_method || "",
      authenticityToken: this.props.authenticity_token || ""
    }
  }

  render() {
    const {dropzone, formUrl, formMethod, authenticityToken} = this.state
    return (
      <div className="container">
        <Form dropzone={dropzone} url={formUrl} method={formMethod} authenticityToken={authenticityToken} />
      </div>
    )
  }
}