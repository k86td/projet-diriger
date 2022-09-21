export default function validateInfo(values) {
    let errors = {};

    if (!values.username.trim()) {
        errors.password = "Nom d'utilisateur requis";
    }

    if (!values.password.trim()) {
        errors.password = 'Password requis';
    }
}