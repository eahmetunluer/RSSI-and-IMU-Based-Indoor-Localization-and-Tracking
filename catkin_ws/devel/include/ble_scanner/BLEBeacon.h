// Generated by gencpp from file ble_scanner/BLEBeacon.msg
// DO NOT EDIT!


#ifndef BLE_SCANNER_MESSAGE_BLEBEACON_H
#define BLE_SCANNER_MESSAGE_BLEBEACON_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ble_scanner
{
template <class ContainerAllocator>
struct BLEBeacon_
{
  typedef BLEBeacon_<ContainerAllocator> Type;

  BLEBeacon_()
    : mac_address()
    , rssi()  {
    }
  BLEBeacon_(const ContainerAllocator& _alloc)
    : mac_address(_alloc)
    , rssi(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _mac_address_type;
  _mac_address_type mac_address;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _rssi_type;
  _rssi_type rssi;





  typedef boost::shared_ptr< ::ble_scanner::BLEBeacon_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ble_scanner::BLEBeacon_<ContainerAllocator> const> ConstPtr;

}; // struct BLEBeacon_

typedef ::ble_scanner::BLEBeacon_<std::allocator<void> > BLEBeacon;

typedef boost::shared_ptr< ::ble_scanner::BLEBeacon > BLEBeaconPtr;
typedef boost::shared_ptr< ::ble_scanner::BLEBeacon const> BLEBeaconConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ble_scanner::BLEBeacon_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ble_scanner::BLEBeacon_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ble_scanner

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'ble_scanner': ['/home/ubuntu/catkin_ws/src/ble_scanner/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ble_scanner::BLEBeacon_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ble_scanner::BLEBeacon_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ble_scanner::BLEBeacon_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "41e9b6b85696be601788ac9adc1e5c81";
  }

  static const char* value(const ::ble_scanner::BLEBeacon_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x41e9b6b85696be60ULL;
  static const uint64_t static_value2 = 0x1788ac9adc1e5c81ULL;
};

template<class ContainerAllocator>
struct DataType< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ble_scanner/BLEBeacon";
  }

  static const char* value(const ::ble_scanner::BLEBeacon_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string mac_address # MAC address of an access point\n\
string rssi         # signal strength [RSSI]\n\
";
  }

  static const char* value(const ::ble_scanner::BLEBeacon_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mac_address);
      stream.next(m.rssi);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BLEBeacon_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ble_scanner::BLEBeacon_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ble_scanner::BLEBeacon_<ContainerAllocator>& v)
  {
    s << indent << "mac_address: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.mac_address);
    s << indent << "rssi: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.rssi);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLE_SCANNER_MESSAGE_BLEBEACON_H
