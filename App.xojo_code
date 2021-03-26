#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  me.setAsAccessory()
		  
		  
		End Sub
	#tag EndEvent


	#tag ExternalMethod, Flags = &h0
		Declare Sub activateIgnoringOtherApps Lib "Cocoa" Selector "activateIgnoringOtherApps:" (receiver as Ptr, ignore as Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function NSClassFromString Lib "Cocoa" (className as CFStringRef) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function setActivationPolicy Lib "Cocoa" Selector "setActivationPolicy:" (receiver as Ptr, options as ApplicationActivationPolicy) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Sub setAsAccessory()
		  if not me.isRegular then return
		  
		  
		  var sApp As Ptr = NSClassFromString( "NSApplication" )
		  
		  sApp = SharedApplication( sApp )
		  
		  
		  var result as Boolean = setActivationPolicy( sApp, ApplicationActivationPolicy.Accessory )
		  
		  
		  me.isRegular = not result
		  
		  
		  if not result then return
		  
		  
		  activateIgnoringOtherApps( sApp, true )
		  
		  
		  Window1.updateButtons()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setAsRegular()
		  if me.isRegular then return
		  
		  
		  var sApp As Ptr = NSClassFromString( "NSApplication" )
		  
		  sApp = SharedApplication( sApp )
		  
		  
		  var result as Boolean = setActivationPolicy( sApp, ApplicationActivationPolicy.Regular )
		  
		  
		  me.isRegular = result
		  
		  
		  Window1.updateButtons()
		  
		  
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SharedApplication Lib "Cocoa" Selector "sharedApplication" (receiver as Ptr) As Ptr
	#tag EndExternalMethod


	#tag Property, Flags = &h0
		isRegular As Boolean = true
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag Enum, Name = ApplicationActivationPolicy, Flags = &h0
		Regular
		  Accessory
		Prohibited
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="isRegular"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
