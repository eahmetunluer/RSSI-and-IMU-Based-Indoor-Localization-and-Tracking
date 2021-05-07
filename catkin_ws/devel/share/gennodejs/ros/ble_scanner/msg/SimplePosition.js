// Auto-generated. Do not edit!

// (in-package ble_scanner.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class SimplePosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_position = null;
      this.y_position = null;
    }
    else {
      if (initObj.hasOwnProperty('x_position')) {
        this.x_position = initObj.x_position
      }
      else {
        this.x_position = '';
      }
      if (initObj.hasOwnProperty('y_position')) {
        this.y_position = initObj.y_position
      }
      else {
        this.y_position = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SimplePosition
    // Serialize message field [x_position]
    bufferOffset = _serializer.string(obj.x_position, buffer, bufferOffset);
    // Serialize message field [y_position]
    bufferOffset = _serializer.string(obj.y_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SimplePosition
    let len;
    let data = new SimplePosition(null);
    // Deserialize message field [x_position]
    data.x_position = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [y_position]
    data.y_position = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.x_position.length;
    length += object.y_position.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ble_scanner/SimplePosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aab86a45c2e294c1cd32aeeb0e43f193';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string x_position
    string y_position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SimplePosition(null);
    if (msg.x_position !== undefined) {
      resolved.x_position = msg.x_position;
    }
    else {
      resolved.x_position = ''
    }

    if (msg.y_position !== undefined) {
      resolved.y_position = msg.y_position;
    }
    else {
      resolved.y_position = ''
    }

    return resolved;
    }
};

module.exports = SimplePosition;
