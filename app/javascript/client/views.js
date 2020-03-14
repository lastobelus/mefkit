import createChannel from "client/cable";

let callback;

const views = createChannel("ViewsChannel", {
  received({ message }) {
    if (callback) callback.call(null, message);
  }
});

// Sending a message: "perform" method calls a respective Ruby method
// defined in views_channel.rb. That's your bridge between JS and Ruby!
const sendMessage = message => views.perform("send_message", { message });

// Getting a message: this callback will be invoked once we receive
// something over ChatChannel
const setCallback = fn => {
  callback = fn;
};

export { sendMessage, setCallback };