package {

import flash.external.ExternalInterface;

public function jsObject(obj:String):Object {
	var ret:Object  = new Object(); 
	var methods:Array = ExternalInterface.call( (<![CDATA[
		function(o) {
			o = eval(o);
			var a = new Array();
			for(var m in o) {
				if(typeof o[m] == 'function') { a.push(m); }
			}
			return a;
		}
		]]>).toString(), obj);
	if(methods == null || methods.length == 0) {
		return null;
	}
	for each (var m:String in methods) {
		ret[m] = function(m:String) { // closure to catch current m
			return function(... rest) {
				ExternalInterface.marshallExceptions = true;
				rest.unshift(obj + '.' + m);
				return ExternalInterface.call.apply(null, rest);
			}
		}(m);
	}
	return ret;
}

}
