import 'dart:typed_data';
import 'package:hive/hive.dart';

class Uint8ListAdapter extends TypeAdapter<Uint8List> {
  @override
  final int typeId = 0; // Unique identifier for your type

  @override
  Uint8List read(BinaryReader reader, {int? length}) {
    final len =
        length ?? reader.readUint32(); // Read the length of the Uint8List
    return reader.readByteList(len); // Read the Uint8List data
  }

  @override
  void write(BinaryWriter writer, Uint8List obj) {
    writer.writeUint32(obj.length); // Write the length of the Uint8List
    writer.writeByteList(obj); // Write the Uint8List data
  }
}
