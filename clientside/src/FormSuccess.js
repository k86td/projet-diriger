import React from 'react';
import './Form.css';

const FormSuccess = () => {
  return (
    <div className='form-content-right'>
      <h1 className='form-success'>Nous avons bien reçu votre demande!</h1>
      <img className='form-img-2' src='img/confirmation.png' alt='success-image' />
    </div>
  );
};

export default FormSuccess;
