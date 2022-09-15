export default function validateInfo(values) {
  let errors = {};

  if (!values.prenom.trim()) {
    errors.prenom = 'Prenom requis';
  }

  if (!values.nom.trim()) {
    errors.nom = 'Nom requis';
  }

  if (!values.adresse.trim()) {
    errors.adresse = 'Adresse requis';
  }

  if (!values.telephone.trim()) {
    errors.telephone = 'Telephone requis';
  }

  if (!values.email) {
    errors.email = 'Email requis';
  } else if (!/\S+@\S+\.\S+/.test(values.email)) {
    errors.email = 'Email address is invalid';
  }
  if (!values.password) {
    errors.password = 'Password is required';
  } else if (values.password.length < 6) {
    errors.password = 'Password needs to be 6 characters or more';
  }

  if (!values.password2) {
    errors.password2 = 'Password is required';
  } else if (values.password2 !== values.password) {
    errors.password2 = 'Passwords do not match';
  }
  return errors;
}
