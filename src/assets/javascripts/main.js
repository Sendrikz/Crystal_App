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
    var server = new WebSocket("ws://kma-community.herokuapp.com");

    server.onmessage = function (event) {
      var messages = JSON.parse(event.data);
      self.setState({messages: messages});
      window.scrollTo(0, document.body.scrollHeight);
      self.refs.message.focus();
    };

    server.onopen = function () {
      console.log("Open");
    };

    server.onclose = function () {
      console.log();("Close");
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
    return React.createElement("div", {className: "room-message-text"},
        React.createElement('span', null, user+": "),
        React.createElement('span', null, message.text.trim())
    );
    });

    return React.createElement("div", {className: "room-message-answer"},
        React.createElement("ul", {className: "messages"}, messages),
        React.createElement("input", { className: "typping", autofocus: true, placeholder: "Write your message!", type: "text", ref: "message", onKeyUp: this.sendMessageWithEnter }),
        React.createElement("button", { className: "send-btn", type: "button", onClick: this.sendMessage }, "Send")
      );
    }

});

ReactDOM.render(React.createElement(Chat, null), document.getElementById('chat'));
