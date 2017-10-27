def get_team_id_from_mobileprovision(mobileprovision)
	output = `/usr/libexec/PlistBuddy -c 'Print :Entitlements:com.apple.developer.team-identifier' /dev/stdin <<< $(security cms -D -i #{mobileprovision} 2>/dev/null)`
	result = output.strip()
	return result
end

def get_bundle_id_from_mobileprovision(mobileprovision)
	output = `/usr/libexec/PlistBuddy -c 'Print :Entitlements:application-identifier' /dev/stdin <<< $(security cms -D -i #{mobileprovision} 2>/dev/null)`
	result = output.split('.').drop(1).join('.').strip()
	return result
end

def get_code_sign_identity_from_mobileprovision(mobileprovision)
	output = `/usr/libexec/PlistBuddy -c 'Print DeveloperCertificates:0' /dev/stdin <<< $(security cms -D -i #{mobileprovision} 2>/dev/null) | openssl x509 -inform DER -noout -subject -nameopt multiline,utf8,-esc_msb,nofname`
	result = output.split("\n")[2].strip()
	return result
end

def get_mobileprovision_get_task_allow(mobileprovision)
	output = `/usr/libexec/PlistBuddy -c 'Print :Entitlements:get-task-allow' /dev/stdin <<< $(security cms -D -i #{mobileprovision} 2>/dev/null)`
	result = output.strip()
	return result
end

def get_mobileprovision_devices(mobileprovision)
	output = `/usr/libexec/PlistBuddy -c 'Print :ProvisionedDevices' 2>>/dev/null /dev/stdin <<< $(security cms -D -i #{mobileprovision} 2>/dev/null)`
	result = output.strip()
	return output
end

# type:
# => 0 development
# => 1 ad-hoc
# => 2 app-store
def get_mobileprovision_type(mobileprovision)
	task_allow = get_mobileprovision_get_task_allow(mobileprovision)
	# development mobileprovision allow debugger to attach
	if task_allow == 'true' then
		return 0
	else
		devices = get_mobileprovision_devices(mobileprovision)
		# ad-hoc mobileprovision has devices list
		if devices != '' then
			return 1
		# app-store mobileprovision doesn't have devices list
		else
			return 2
		end
	end
end

# codeSignIdentity options:
# => iPhone Developer (development)
# => iPhone Distribution (app-store & ad-hoc)
def get_codeSignIdentity(type)
	if type == 0 then
		return 'iPhone Developer'
	elsif type == 1 or type == 2 then
		return 'iPhone Distribution'
	else
		raise "Unknown mobileprovision type #{type}"
	end
end

# export_method options:
# => app-store
# => ad-hoc
# => development
def get_export_method(type)
	if type == 0 then
		return 'development'
	elsif type == 1 then
		return 'ad-hoc'
	elsif type == 2 then
		return 'app-store'
	else
		raise "Unknown mobileprovision type #{type}"
	end
end
