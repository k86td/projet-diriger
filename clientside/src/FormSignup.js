import React from 'react';
import validate from './validateInfo';
import useForm from './useForm';
import './Form.css';

const FormSignup = ({ submitForm }) => {
  const { handleChange, handleSubmit, values, errors } = useForm(
    submitForm,
    validate
  );

  return (
    <div className='form-content-right'>
      <form onSubmit={handleSubmit} className='form' noValidate>
        <h1>
         veuillez entrez vos informations
        </h1>
        <div className='form-inputs'>
          <label className='form-label'>Prenom</label>
          <input
            className='form-input'
            type='text'
            name='prenom'
            placeholder='Entrez votre prenom'
            value={values.prenom}
            onChange={handleChange}
          />
          {errors.prenom && <p>{errors.prenom}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Nom</label>
          <input
            className='form-input'
            type='text'
            name='nom'
            placeholder='Entrez votre nom'
            value={values.nom}
            onChange={handleChange}
          />
          {errors.nom && <p>{errors.nom}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Adresse</label>
          <input
            className='form-input'
            type='text'
            name='adresse'
            placeholder='Entrez votre Adresse'
            value={values.adresse}
            onChange={handleChange}
          />
          {errors.adresse && <p>{errors.adresse}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Telephone</label>
          <input
            className='form-input'
            type='text'
            name='telephone'
            placeholder='Entrez votre Telephone'
            value={values.telephone}
            onChange={handleChange}
          />
          {errors.telephone && <p>{errors.telephone}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Email</label>
          <input
            className='form-input'
            type='email'
            name='email'
            placeholder='Enter your email'
            value={values.email}
            onChange={handleChange}
          />
          {errors.email && <p>{errors.email}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Password</label>
          <input
            className='form-input'
            type='password'
            name='password'
            placeholder='Enter your password'
            value={values.password}
            onChange={handleChange}
          />
          {errors.password && <p>{errors.password}</p>}
        </div>
        <div className='form-inputs'>
          <label className='form-label'>Confirm Password</label>
          <input
            className='form-input'
            type='password'
            name='password2'
            placeholder='Confirm your password'
            value={values.password2}
            onChange={handleChange}
          />
          {errors.password2 && <p>{errors.password2}</p>}
        </div>
        <button className='form-input-btn' type='submit'>
          Sign up
        </button>
        <span className='form-input-login'>
          déjà un compte? Login <a href='#'>ici</a>
        </span>
      </form>
    </div>
  );
};

export default FormSignup;
