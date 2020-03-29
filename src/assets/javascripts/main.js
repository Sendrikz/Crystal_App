var Chat = React.createClass({

  getInitialState: function () {
    return {
      message: '',
      messages: []
    };
  },

  componentDidMount: function () {
    var self = this;
    this.sendable = true;
    var server = new WebSocket("ws://" + location.hostname + ":" + location.port);

    server.onmessage = function (event) {
      console.log(event.data);
      var messages = JSON.parse(event.data);
      self.setState({messages: messages});
      window.scrollTo(0, document.body.scrollHeight);
      self.refs.message.focus();
    };

    server.onopen = function () {
      alert("Open");
    };

    server.onclose = function () {
      alert("Close");
    };

    this.server = server;
    this.refs.message.focus();
  },

  sendMessage: function () {
    if (!this.sendable) {
      return false;
    }
    console.log(this.refs.message.value);
    var self = this;
    setTimeout(function () {
      self.sendable = true;
    }, 100);
    this.server.send(this.refs.message.value);
    this.refs.message.value = '';
    this.sendable = false;
  },

  sendMessageWithEnter: function (e) {
    if (e.keyCode == 13) {
     this.sendMessage();
    }
  },

  render: function () {
    var messages = this.state.messages.map(function (message) {
    var user = message.name + message.surname;
    return React.createElement("li", null,
        React.createElement('span', null, user+": "),
        React.createElement('span', null, message.text.trim())
    );
    });

    return React.createElement("div", null,
        React.createElement("ul", null, messages),
        React.createElement("input", { autofocus: true, placeholder: "write your message!", type: "text", ref: "message", onKeyUp: this.sendMessageWithEnter }),
        React.createElement("button", { type: "button", onClick: this.sendMessage }, "Send")
      );
    }

});

ReactDOM.render(React.createElement(Chat, null), document.getElementById('chat'));
