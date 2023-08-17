// Auto-generated. Do not edit!

// (in-package mdwa_planning.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class threat_points {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.impact_points = null;
      this.impact_times = null;
    }
    else {
      if (initObj.hasOwnProperty('impact_points')) {
        this.impact_points = initObj.impact_points
      }
      else {
        this.impact_points = [];
      }
      if (initObj.hasOwnProperty('impact_times')) {
        this.impact_times = initObj.impact_times
      }
      else {
        this.impact_times = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type threat_points
    // Serialize message field [impact_points]
    // Serialize the length for message field [impact_points]
    bufferOffset = _serializer.uint32(obj.impact_points.length, buffer, bufferOffset);
    obj.impact_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [impact_times]
    bufferOffset = _serializer.float32(obj.impact_times, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type threat_points
    let len;
    let data = new threat_points(null);
    // Deserialize message field [impact_points]
    // Deserialize array length for message field [impact_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.impact_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.impact_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [impact_times]
    data.impact_times = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.impact_points.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mdwa_planning/threat_points';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d5e7da5fa6baa9aa54f04458b40de75';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point[] impact_points
    float32 impact_times
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new threat_points(null);
    if (msg.impact_points !== undefined) {
      resolved.impact_points = new Array(msg.impact_points.length);
      for (let i = 0; i < resolved.impact_points.length; ++i) {
        resolved.impact_points[i] = geometry_msgs.msg.Point.Resolve(msg.impact_points[i]);
      }
    }
    else {
      resolved.impact_points = []
    }

    if (msg.impact_times !== undefined) {
      resolved.impact_times = msg.impact_times;
    }
    else {
      resolved.impact_times = 0.0
    }

    return resolved;
    }
};

module.exports = threat_points;
