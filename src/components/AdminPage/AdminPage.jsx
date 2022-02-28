import {useEffect} from 'react';
import {useDispatch, useSelector} from 'react-redux';
import Table from 'react-bootstrap/Table';


function AdminPage() {

    const dispatch = useDispatch();
    const allUsers = useSelector(store => store.admin);
    const currentUser = useSelector(store => store.user);

    useEffect(() => {
        dispatch({type: 'FETCH_USERS'});
    }, []);


    // This page is responsible for displaying a table of all non-admin users with the ability to delete each of them if the user
    // is logged in as the admin. Conditional rendering is used to display the table if the user is an admin, and if the user is not
    // an admin, they see a blank page when they navigate to the /admin route manually.
    return (
        <>
            {currentUser.isAdmin &&
                <div className="adminContainer">
                    <Table striped bordered variant="dark">
                        <thead>
                            <tr><th>ID</th><th>Username</th><th>Remove User</th></tr>
                        </thead>
                        <tbody>
                            {allUsers.map(person => {
                                return (
                                    <tr key={person?.id}><td>{person?.id}</td><td>{person?.username}</td><td><button onClick={() => dispatch({type: 'DELETE_ACCOUNT', payload: {id: person?.id}})}>Delete</button></td></tr>
                                );
                            })}
                        </tbody>
                    </Table>
                </div>
        }
        </>
    );
}



export default AdminPage;