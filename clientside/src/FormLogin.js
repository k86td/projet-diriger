import React from 'react';
import validate from './validateLogin';
import useForm from './useForm';
import './Form.css';

const FormLogin = ({ submitForm }) => {
    const { handleChange, handleSubmit, values, errors } = useForm(
        submitForm,
        validate
    );

    return (
        <div className='form-content-right'>
            <form onSubmit={handleSubmit} className='form' noValidate>
                <h1>
                    Connecter vous pour accéder aux services offerts!
                </h1>
                <div className='form-inputs'>
                    <input
                        className='form-input'
                        type='text'
                        name='username'
                        placeholder="Nom d'utilisateur"
                        value={values.username}
                        onChange={handleChange}
                    />
                    {errors.username && <p>{errors.username}</p>}
                </div>
                <div className='form-inputs'>
                    <input
                        className='form-input'
                        type='password'
                        name='password'
                        placeholder='Mot de passe'
                        value={values.password}
                        onChange={handleChange}
                    />
                    {errors.password && <p>{errors.password}</p>}
                </div>
                <button className='form-input-btn' type='submit'>
                    Connexion
                </button>
                <span className='form-input-login'>
                    Pas encore inscrit? Faites le <a href='#'>ici</a>!
                </span>
            </form>
        </div>
    );
};

export default FormLogin;
