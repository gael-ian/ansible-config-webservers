import re

from ansible.errors import AnsibleError

def urlize(string):
  '''
  Given a string, return an urlized version of the string.
  '''
  if string is None:
    raise AnsibleError('String not found')

  s = string.lower()                  # Turn string to lower case
  s = re.sub(r"[^a-z0-9]",  "-",  s)  # Replace all non-letter non-digits char by '-'
  s = re.sub(r"-{2,}",      "-",  s)  # Merge multiple '-'
  s = re.sub(r"-$",         "",   s)  # Remove trailing '-'
  s = re.sub(r"^-",         "",   s)  # Remove leading '-'
  return s

class FilterModule(object):
  ''' Query filter '''

  def filters(self):
    return {
      'urlize': urlize
    }
