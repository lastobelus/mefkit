import consumer from "./consumer";

consumer.subscriptions.create("PingChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("PingChannel connected");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.error("PingChannel disconnected");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("PingChannel received", data);
  }
});
