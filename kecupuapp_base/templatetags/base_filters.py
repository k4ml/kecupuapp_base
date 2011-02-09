from django import template

register = template.Library()

def pdb_trace(variable):
    import pdb; pdb.set_trace()
    return variable

register.filter('pdb_trace', pdb_trace)
