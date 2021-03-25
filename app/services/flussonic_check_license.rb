class FlussonicCheckLicense
  def check(license)
    last_version = Date.strptime(FlussonicLastVersion.new.get, '%y.%m')
    avail_licenses = []
    version = last_version
    5.times do
      version = version.prev_month
      avail_licenses << version.strftime('%y.%m')
    end

    avail_licenses.delete_if do |date|
      (!license.max_version.nil? { date > license.max_version }) |
        (!license.min_version.nil? { date < license.min_version }) |
        (date < license.paid_till)
    end

    if avail_licenses.empty?
      last_version
    else
      avail_licenses
    end
  end
end
