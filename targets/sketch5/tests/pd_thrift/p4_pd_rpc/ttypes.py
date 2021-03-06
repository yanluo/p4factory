#
# Autogenerated by Thrift Compiler (0.9.2)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
#  options string: py
#

from thrift.Thrift import TType, TMessageType, TException, TApplicationException
import res_pd_rpc.ttypes


from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol, TProtocol
try:
  from thrift.protocol import fastbinary
except:
  fastbinary = None



class sketch_counter_value_t:
  """
  Attributes:
   - packets
   - bytes
  """

  thrift_spec = (
    None, # 0
    (1, TType.I64, 'packets', None, None, ), # 1
    (2, TType.I64, 'bytes', None, None, ), # 2
  )

  def __init__(self, packets=None, bytes=None,):
    self.packets = packets
    self.bytes = bytes

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I64:
          self.packets = iprot.readI64();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.I64:
          self.bytes = iprot.readI64();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_counter_value_t')
    if self.packets is not None:
      oprot.writeFieldBegin('packets', TType.I64, 1)
      oprot.writeI64(self.packets)
      oprot.writeFieldEnd()
    if self.bytes is not None:
      oprot.writeFieldBegin('bytes', TType.I64, 2)
      oprot.writeI64(self.bytes)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.packets is None:
      raise TProtocol.TProtocolException(message='Required field packets is unset!')
    if self.bytes is None:
      raise TProtocol.TProtocolException(message='Required field bytes is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.packets)
    value = (value * 31) ^ hash(self.bytes)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_counter_flags_t:
  """
  Attributes:
   - read_hw_sync
  """

  thrift_spec = (
    None, # 0
    (1, TType.BOOL, 'read_hw_sync', None, None, ), # 1
  )

  def __init__(self, read_hw_sync=None,):
    self.read_hw_sync = read_hw_sync

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.BOOL:
          self.read_hw_sync = iprot.readBool();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_counter_flags_t')
    if self.read_hw_sync is not None:
      oprot.writeFieldBegin('read_hw_sync', TType.BOOL, 1)
      oprot.writeBool(self.read_hw_sync)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.read_hw_sync is None:
      raise TProtocol.TProtocolException(message='Required field read_hw_sync is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.read_hw_sync)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_ipv4_lpm_match_spec_t:
  """
  Attributes:
   - ipv4_dstAddr
   - ipv4_dstAddr_prefix_length
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'ipv4_dstAddr', None, None, ), # 1
    (2, TType.I16, 'ipv4_dstAddr_prefix_length', None, None, ), # 2
  )

  def __init__(self, ipv4_dstAddr=None, ipv4_dstAddr_prefix_length=None,):
    self.ipv4_dstAddr = ipv4_dstAddr
    self.ipv4_dstAddr_prefix_length = ipv4_dstAddr_prefix_length

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.ipv4_dstAddr = iprot.readI32();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.I16:
          self.ipv4_dstAddr_prefix_length = iprot.readI16();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_ipv4_lpm_match_spec_t')
    if self.ipv4_dstAddr is not None:
      oprot.writeFieldBegin('ipv4_dstAddr', TType.I32, 1)
      oprot.writeI32(self.ipv4_dstAddr)
      oprot.writeFieldEnd()
    if self.ipv4_dstAddr_prefix_length is not None:
      oprot.writeFieldBegin('ipv4_dstAddr_prefix_length', TType.I16, 2)
      oprot.writeI16(self.ipv4_dstAddr_prefix_length)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.ipv4_dstAddr is None:
      raise TProtocol.TProtocolException(message='Required field ipv4_dstAddr is unset!')
    if self.ipv4_dstAddr_prefix_length is None:
      raise TProtocol.TProtocolException(message='Required field ipv4_dstAddr_prefix_length is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.ipv4_dstAddr)
    value = (value * 31) ^ hash(self.ipv4_dstAddr_prefix_length)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_forward_match_spec_t:
  """
  Attributes:
   - routing_metadata_nhop_ipv4
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'routing_metadata_nhop_ipv4', None, None, ), # 1
  )

  def __init__(self, routing_metadata_nhop_ipv4=None,):
    self.routing_metadata_nhop_ipv4 = routing_metadata_nhop_ipv4

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.routing_metadata_nhop_ipv4 = iprot.readI32();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_forward_match_spec_t')
    if self.routing_metadata_nhop_ipv4 is not None:
      oprot.writeFieldBegin('routing_metadata_nhop_ipv4', TType.I32, 1)
      oprot.writeI32(self.routing_metadata_nhop_ipv4)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.routing_metadata_nhop_ipv4 is None:
      raise TProtocol.TProtocolException(message='Required field routing_metadata_nhop_ipv4 is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.routing_metadata_nhop_ipv4)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_send_frame_match_spec_t:
  """
  Attributes:
   - standard_metadata_egress_port
  """

  thrift_spec = (
    None, # 0
    (1, TType.I16, 'standard_metadata_egress_port', None, None, ), # 1
  )

  def __init__(self, standard_metadata_egress_port=None,):
    self.standard_metadata_egress_port = standard_metadata_egress_port

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I16:
          self.standard_metadata_egress_port = iprot.readI16();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_send_frame_match_spec_t')
    if self.standard_metadata_egress_port is not None:
      oprot.writeFieldBegin('standard_metadata_egress_port', TType.I16, 1)
      oprot.writeI16(self.standard_metadata_egress_port)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.standard_metadata_egress_port is None:
      raise TProtocol.TProtocolException(message='Required field standard_metadata_egress_port is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.standard_metadata_egress_port)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_redirect_match_spec_t:
  """
  Attributes:
   - standard_metadata_instance_type
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'standard_metadata_instance_type', None, None, ), # 1
  )

  def __init__(self, standard_metadata_instance_type=None,):
    self.standard_metadata_instance_type = standard_metadata_instance_type

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.standard_metadata_instance_type = iprot.readI32();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_redirect_match_spec_t')
    if self.standard_metadata_instance_type is not None:
      oprot.writeFieldBegin('standard_metadata_instance_type', TType.I32, 1)
      oprot.writeI32(self.standard_metadata_instance_type)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.standard_metadata_instance_type is None:
      raise TProtocol.TProtocolException(message='Required field standard_metadata_instance_type is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.standard_metadata_instance_type)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_set_myvalue_match_spec_t:
  """
  Attributes:
   - standard_metadata_instance_type
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'standard_metadata_instance_type', None, None, ), # 1
  )

  def __init__(self, standard_metadata_instance_type=None,):
    self.standard_metadata_instance_type = standard_metadata_instance_type

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.standard_metadata_instance_type = iprot.readI32();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_set_myvalue_match_spec_t')
    if self.standard_metadata_instance_type is not None:
      oprot.writeFieldBegin('standard_metadata_instance_type', TType.I32, 1)
      oprot.writeI32(self.standard_metadata_instance_type)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.standard_metadata_instance_type is None:
      raise TProtocol.TProtocolException(message='Required field standard_metadata_instance_type is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.standard_metadata_instance_type)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_set_nhop_action_spec_t:
  """
  Attributes:
   - action_nhop_ipv4
   - action_port
  """

  thrift_spec = (
    None, # 0
    (1, TType.I32, 'action_nhop_ipv4', None, None, ), # 1
    (2, TType.I16, 'action_port', None, None, ), # 2
  )

  def __init__(self, action_nhop_ipv4=None, action_port=None,):
    self.action_nhop_ipv4 = action_nhop_ipv4
    self.action_port = action_port

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.I32:
          self.action_nhop_ipv4 = iprot.readI32();
        else:
          iprot.skip(ftype)
      elif fid == 2:
        if ftype == TType.I16:
          self.action_port = iprot.readI16();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_set_nhop_action_spec_t')
    if self.action_nhop_ipv4 is not None:
      oprot.writeFieldBegin('action_nhop_ipv4', TType.I32, 1)
      oprot.writeI32(self.action_nhop_ipv4)
      oprot.writeFieldEnd()
    if self.action_port is not None:
      oprot.writeFieldBegin('action_port', TType.I16, 2)
      oprot.writeI16(self.action_port)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.action_nhop_ipv4 is None:
      raise TProtocol.TProtocolException(message='Required field action_nhop_ipv4 is unset!')
    if self.action_port is None:
      raise TProtocol.TProtocolException(message='Required field action_port is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.action_nhop_ipv4)
    value = (value * 31) ^ hash(self.action_port)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_rewrite_mac_action_spec_t:
  """
  Attributes:
   - action_smac
  """

  thrift_spec = (
    None, # 0
    (1, TType.STRING, 'action_smac', None, None, ), # 1
  )

  def __init__(self, action_smac=None,):
    self.action_smac = action_smac

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.STRING:
          self.action_smac = iprot.readString();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_rewrite_mac_action_spec_t')
    if self.action_smac is not None:
      oprot.writeFieldBegin('action_smac', TType.STRING, 1)
      oprot.writeString(self.action_smac)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.action_smac is None:
      raise TProtocol.TProtocolException(message='Required field action_smac is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.action_smac)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)

class sketch_set_dmac_action_spec_t:
  """
  Attributes:
   - action_dmac
  """

  thrift_spec = (
    None, # 0
    (1, TType.STRING, 'action_dmac', None, None, ), # 1
  )

  def __init__(self, action_dmac=None,):
    self.action_dmac = action_dmac

  def read(self, iprot):
    if iprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and isinstance(iprot.trans, TTransport.CReadableTransport) and self.thrift_spec is not None and fastbinary is not None:
      fastbinary.decode_binary(self, iprot.trans, (self.__class__, self.thrift_spec))
      return
    iprot.readStructBegin()
    while True:
      (fname, ftype, fid) = iprot.readFieldBegin()
      if ftype == TType.STOP:
        break
      if fid == 1:
        if ftype == TType.STRING:
          self.action_dmac = iprot.readString();
        else:
          iprot.skip(ftype)
      else:
        iprot.skip(ftype)
      iprot.readFieldEnd()
    iprot.readStructEnd()

  def write(self, oprot):
    if oprot.__class__ == TBinaryProtocol.TBinaryProtocolAccelerated and self.thrift_spec is not None and fastbinary is not None:
      oprot.trans.write(fastbinary.encode_binary(self, (self.__class__, self.thrift_spec)))
      return
    oprot.writeStructBegin('sketch_set_dmac_action_spec_t')
    if self.action_dmac is not None:
      oprot.writeFieldBegin('action_dmac', TType.STRING, 1)
      oprot.writeString(self.action_dmac)
      oprot.writeFieldEnd()
    oprot.writeFieldStop()
    oprot.writeStructEnd()

  def validate(self):
    if self.action_dmac is None:
      raise TProtocol.TProtocolException(message='Required field action_dmac is unset!')
    return


  def __hash__(self):
    value = 17
    value = (value * 31) ^ hash(self.action_dmac)
    return value

  def __repr__(self):
    L = ['%s=%r' % (key, value)
      for key, value in self.__dict__.iteritems()]
    return '%s(%s)' % (self.__class__.__name__, ', '.join(L))

  def __eq__(self, other):
    return isinstance(other, self.__class__) and self.__dict__ == other.__dict__

  def __ne__(self, other):
    return not (self == other)
