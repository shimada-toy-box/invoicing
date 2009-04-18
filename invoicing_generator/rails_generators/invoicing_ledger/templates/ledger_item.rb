<% if name_details[:line_item][:underscore_plural] != 'line_items' -%>
acts_as_ledger_item :line_items => :<%= name_details[:line_item][:underscore_plural] %>
<% else -%>
acts_as_ledger_item
<% end -%>

has_many :<%= name_details[:line_item][:underscore_plural] %>

# Change the following associations to refer to your customer or supplier model class
#belongs_to :sender, :class_name => 'FIXME'
#belongs_to :recipient, :class_name => 'FIXME'

# Returns a hash containing details about the sender of this invoice, credit note or payment. This allows
# you to integrate the invoicing gem with your existing model objects for users and customers/suppliers.
#
# The returned hash should have the following keys:
# <tt>:is_self</tt>::      +true+ if these details refer to yourself, i.e. the person or organsiation who owns/operates
#                          this application. +false+ if these details refer to any other party.
# <tt>:name</tt>::         The name of the person or organisation whose billing address is defined below.
# <tt>:contact_name</tt>:: The name of a person/department within the organisation named by <tt>:name</tt>.
# <tt>:address</tt>::      The body of the billing address (not including city, postcode, state and country); may be
#                          a multi-line string, with lines separated by '\n' line breaks.
# <tt>:city</tt>::         The name of the city or town in the billing address.
# <tt>:state</tt>::        The state/region/province/county of the billing address as appropriate.
# <tt>:postal_code</tt>::  The postal code of the billing address (e.g. ZIP code in the US).
# <tt>:country</tt>::      The billing address country (human-readable).
# <tt>:country_code</tt>:: The two-letter country code of the billing address, according to
#                          ISO-3166-1[http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2].
# <tt>:tax_number</tt>::   The Value Added Tax registration code of this person or organisation, if they have
#                          one, preferably including the country identifier at the beginning. This is important for
#                          transactions within the European Union.
def sender_details
  raise 'FIXME: you must implement <%= name_details[:ledger_item][:class_name_full]#sender_details'
end

# Returns a hash containing details about the recipient of this invoice, credit note or payment,
# in the same format as returned by +sender_details+.
def recipient_details
  raise 'FIXME: you must implement <%= name_details[:ledger_item][:class_name_full]#recipient_details'
end
