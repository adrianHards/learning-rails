## Dictionary

#### Action Cable

a framework that provides real-time communication over web sockets. **Web sockets** are a communication protocol that enables real-time, two-way communication between a client (such as a web browser) and a server. Unlike traditional HTTP requests, which are unidirectional and require a new connection to be established for each request, web sockets provide a persistent connection that enables data to be sent and received in real-time.

##### Subscription
refers to the process of a client (such as a web browser) requesting to receive updates or data from the server over a web socket connection. Once the subscription is established, the server can push data or updates to the client in real-time, without the client needing to make additional requests. 

##### Broadcasting
refers to the process of sending data or events to all clients subscribed to a specific channel.

### Schema

Lets assume a simple setup. Three tables, one for messages, one for users and one for chatrooms. 
* A chatroom can have many messages, but a message should only belong to one room. That's why a message needs a chatroom_id. 
* We need to know who sent a message. A user can send many messages, but a message should only belong to one user. So a message also needs a user_id. 

`yarn add @rails/actioncable`

steam_from is like creating different channels from our radio tower
need to import rails/actioncable in stimulus, want to connect to channel on page connect
stream_for makes different chatroom for each channel based on its id
