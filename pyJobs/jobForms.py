from wtforms import (
     Form,
     StringField,
     TextAreaField,
     validators
)

class BaseForm(Form):
    class Meta:
        csrf = False  # Enable CSRF
        #csrf_class = SomeCSRF  # Set the CSRF implementation
        #csrf_secret = b'foobar'  # Some implementations need a secret key.
        # Any other CSRF settings here.

class JobOfferForm(Form):
    position = StringField(u'Puesto', validators=[validators.input_required()])
    company = StringField(u'Empresa', validators=[validators.input_required()])
    location = StringField(u'Ubicación', validators=[validators.optional()])
    description = TextAreaField(u'Descripción', validators=[validators.input_required()])
    meansOfApplication = StringField(u'Para aplicar', validators=[validators.optional()])