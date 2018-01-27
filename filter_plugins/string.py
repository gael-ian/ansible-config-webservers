import re
from ansible.errors import AnsibleError, AnsibleFilterError

class FilterModule(object):
  ''' Query filter '''

  def filters(self):
    return {
      'slugify': self.slugify
    }

  def slugify(self, string, separator = '-'):
    '''
    Given a string, return an slugified version of the string.
    '''
    if string is None:
      raise AnsibleFilterError('String not found')

    # Turn string to lower case
    s = string.lower()

    # Replace all non-letter non-digits characters suite by separator
    s = re.sub(r"[^a-z0-9]", separator,  s)
    s = re.sub(r"" + re.escape(separator) + "{2,}", separator,  s)

    # Remove leading and trailing separators
    s = re.sub(r"" + re.escape(separator) + "$", "",   s)
    s = re.sub(r"^" + re.escape(separator),      "",   s)

    return s
