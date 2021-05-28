// Generated by gencpp from file ble_scanner/SimplePosition.msg
// DO NOT EDIT!


#ifndef BLE_SCANNER_MESSAGE_SIMPLEPOSITION_H
#define BLE_SCANNER_MESSAGE_SIMPLEPOSITION_H


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
struct SimplePosition_
{
  typedef SimplePosition_<ContainerAllocator> Type;

  SimplePosition_()
    : x_position()
    , y_position()  {
    }
  SimplePosition_(const ContainerAllocator& _alloc)
    : x_position(_alloc)
    , y_position(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _x_position_type;
  _x_position_type x_position;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _y_position_type;
  _y_position_type y_position;





  typedef boost::shared_ptr< ::ble_scanner::SimplePosition_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ble_scanner::SimplePosition_<ContainerAllocator> const> ConstPtr;

}; // struct SimplePosition_

typedef ::ble_scanner::SimplePosition_<std::allocator<void> > SimplePosition;

typedef boost::shared_ptr< ::ble_scanner::SimplePosition > SimplePositionPtr;
typedef boost::shared_ptr< ::ble_scanner::SimplePosition const> SimplePositionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ble_scanner::SimplePosition_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ble_scanner::SimplePosition_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ble_scanner::SimplePosition_<ContainerAllocator1> & lhs, const ::ble_scanner::SimplePosition_<ContainerAllocator2> & rhs)
{
  return lhs.x_position == rhs.x_position &&
    lhs.y_position == rhs.y_position;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ble_scanner::SimplePosition_<ContainerAllocator1> & lhs, const ::ble_scanner::SimplePosition_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ble_scanner

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ble_scanner::SimplePosition_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ble_scanner::SimplePosition_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ble_scanner::SimplePosition_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ble_scanner::SimplePosition_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ble_scanner::SimplePosition_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ble_scanner::SimplePosition_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ble_scanner::SimplePosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "aab86a45c2e294c1cd32aeeb0e43f193";
  }

  static const char* value(const ::ble_scanner::SimplePosition_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xaab86a45c2e294c1ULL;
  static const uint64_t static_value2 = 0xcd32aeeb0e43f193ULL;
};

template<class ContainerAllocator>
struct DataType< ::ble_scanner::SimplePosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ble_scanner/SimplePosition";
  }

  static const char* value(const ::ble_scanner::SimplePosition_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ble_scanner::SimplePosition_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string x_position\n"
"string y_position\n"
;
  }

  static const char* value(const ::ble_scanner::SimplePosition_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ble_scanner::SimplePosition_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x_position);
      stream.next(m.y_position);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SimplePosition_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ble_scanner::SimplePosition_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ble_scanner::SimplePosition_<ContainerAllocator>& v)
  {
    s << indent << "x_position: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.x_position);
    s << indent << "y_position: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.y_position);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BLE_SCANNER_MESSAGE_SIMPLEPOSITION_H
