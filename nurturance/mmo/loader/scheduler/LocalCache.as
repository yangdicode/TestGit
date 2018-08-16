package mmo.loader.scheduler {
	import flash.utils.ByteArray;

	public class LocalCache {
		public function LocalCache() {
		}

		/*
		public static function getByteLocal(url:String):ByteArray {
			if (ConfigReader.instance.allCache) {
				var verString:String = VersManager.getFileVerPostfix(url);
				return BinaryLocalStore.instance.getResData(url, verString);
			}
			return null;
		}

		public static function clearLocal(url:String):void {
			if (ConfigReader.instance.allCache) {
				BinaryLocalStore.instance.setResData(url, "-1", new ByteArray());
			}
		}

		public static function setByteLocal(url:String, byteArray:ByteArray):void {
			if (ConfigReader.instance.allCache) {
				var verString:String = VersManager.getFileVerPostfix(url);
				BinaryLocalStore.instance.setResData(url, verString, byteArray);
			}
		}
		*/
				
		public static function encryptBytes(bytes:ByteArray):ByteArray {
		/*	if (ConfigReader.instance.encrypt) {
				if ((bytes[0] == 67 || bytes[0] == 70) && bytes[1] == 87 && bytes[2] == 83) {
					
				} else {
					mmo.encryptBytes.encryptBytes(bytes);
				}
			}
			*/
			return bytes;
		}
	}
}