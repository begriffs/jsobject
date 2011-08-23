Provides a nicer way to access JavaScript objects through
ExternalInterface in ActionScript 3.

== Before ==

    ExternalInterface.call('obj.method', arg1, arg2, ...);
    ExternalInterface.call('obj.method2', arg1, arg2, ...);
    ExternalInterface.call('obj.method3', arg1, arg2, ...);

== After ==

    var obj = jsObject('obj');
    obj.method(arg1, arg2, ...);
    obj.method2(arg1, arg2, ...);
    obj.method3(arg1, arg2, ...);

This library provides a global function jsObject(obj:String):Object. The
argument obj names a currently instantiated JavaScript object. The
function returns an ActionScript object with the same method signature
as the referenced JavaScript object, but without non-method properties.

The ActionScript object stub uses ExternalInterface to pass parameters,
get return values, and marshall exceptions. If the JavaScript object
has no methods, or is not found, then jsObject returns null.
