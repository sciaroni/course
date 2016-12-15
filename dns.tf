
variable dnsimple_token {}
variable dnsimple_email {}


# Configure the DNSimple provider
provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

# Create a record
resource "dnsimple_record" "www" {
    count = 1
    domain = "test.local"
    name = "www-${count.index}"  
    value = "{element(aws_instance.web.*.public_ip, count.index)}"
    type= "A"
    ttl = 3600	
}
