// Auto-generated. Do not edit!

// (in-package mdwa_planning.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Barrier = require('./Barrier.js');
let Dy_Barrier = require('./Dy_Barrier.js');

//-----------------------------------------------------------

class Environment {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.barrier = null;
      this.dy_obs = null;
      this.obs_size = null;
    }
    else {
      if (initObj.hasOwnProperty('barrier')) {
        this.barrier = initObj.barrier
      }
      else {
        this.barrier = [];
      }
      if (initObj.hasOwnProperty('dy_obs')) {
        this.dy_obs = initObj.dy_obs
      }
      else {
        this.dy_obs = [];
      }
      if (initObj.hasOwnProperty('obs_size')) {
        this.obs_size = initObj.obs_size
      }
      else {
        this.obs_size = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Environment
    // Serialize message field [barrier]
    // Serialize the length for message field [barrier]
    bufferOffset = _serializer.uint32(obj.barrier.length, buffer, bufferOffset);
    obj.barrier.forEach((val) => {
      bufferOffset = Barrier.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [dy_obs]
    // Serialize the length for message field [dy_obs]
    bufferOffset = _serializer.uint32(obj.dy_obs.length, buffer, bufferOffset);
    obj.dy_obs.forEach((val) => {
      bufferOffset = Dy_Barrier.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [obs_size]
    bufferOffset = _serializer.float32(obj.obs_size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Environment
    let len;
    let data = new Environment(null);
    // Deserialize message field [barrier]
    // Deserialize array length for message field [barrier]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.barrier = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.barrier[i] = Barrier.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [dy_obs]
    // Deserialize array length for message field [dy_obs]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.dy_obs = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.dy_obs[i] = Dy_Barrier.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [obs_size]
    data.obs_size = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.barrier.length;
    length += 32 * object.dy_obs.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mdwa_planning/Environment';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '366bf54a33961c132c7cb18ef82cb2bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    mdwa_planning/Barrier[] barrier
    mdwa_planning/Dy_Barrier[] dy_obs
    float32 obs_size
    
    ================================================================================
    MSG: mdwa_planning/Barrier
    float64 x
    float64 y
    
    ================================================================================
    MSG: mdwa_planning/Dy_Barrier
    float64 x
    float64 y
    float64 vx
    float64 vy
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Environment(null);
    if (msg.barrier !== undefined) {
      resolved.barrier = new Array(msg.barrier.length);
      for (let i = 0; i < resolved.barrier.length; ++i) {
        resolved.barrier[i] = Barrier.Resolve(msg.barrier[i]);
      }
    }
    else {
      resolved.barrier = []
    }

    if (msg.dy_obs !== undefined) {
      resolved.dy_obs = new Array(msg.dy_obs.length);
      for (let i = 0; i < resolved.dy_obs.length; ++i) {
        resolved.dy_obs[i] = Dy_Barrier.Resolve(msg.dy_obs[i]);
      }
    }
    else {
      resolved.dy_obs = []
    }

    if (msg.obs_size !== undefined) {
      resolved.obs_size = msg.obs_size;
    }
    else {
      resolved.obs_size = 0.0
    }

    return resolved;
    }
};

module.exports = Environment;
