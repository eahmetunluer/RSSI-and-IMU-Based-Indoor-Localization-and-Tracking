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

class BLEBeacon {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mac_address = null;
      this.rssi = null;
    }
    else {
      if (initObj.hasOwnProperty('mac_address')) {
        this.mac_address = initObj.mac_address
      }
      else {
        this.mac_address = '';
      }
      if (initObj.hasOwnProperty('rssi')) {
        this.rssi = initObj.rssi
      }
      else {
        this.rssi = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BLEBeacon
    // Serialize message field [mac_address]
    bufferOffset = _serializer.string(obj.mac_address, buffer, bufferOffset);
    // Serialize message field [rssi]
    bufferOffset = _serializer.string(obj.rssi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BLEBeacon
    let len;
    let data = new BLEBeacon(null);
    // Deserialize message field [mac_address]
    data.mac_address = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rssi]
    data.rssi = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.mac_address.length;
    length += object.rssi.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ble_scanner/BLEBeacon';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '41e9b6b85696be601788ac9adc1e5c81';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string mac_address # MAC address of an access point
    string rssi         # signal strength [RSSI]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BLEBeacon(null);
    if (msg.mac_address !== undefined) {
      resolved.mac_address = msg.mac_address;
    }
    else {
      resolved.mac_address = ''
    }

    if (msg.rssi !== undefined) {
      resolved.rssi = msg.rssi;
    }
    else {
      resolved.rssi = ''
    }

    return resolved;
    }
};

module.exports = BLEBeacon;
