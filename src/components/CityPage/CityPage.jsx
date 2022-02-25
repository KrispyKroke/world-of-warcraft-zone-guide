import {useDispatch, useSelector} from 'react-redux';
import {useEffect} from 'react';
import {useParams} from 'react-router-dom';

function CityPage() {
    // I used url Params to load the capital city pages. A dispatch is made to populate the city reducer.
    // I also accounted for the scenario where a user refreshes the page manually.  When this happens,
    // the page will still hold the information it had before, with a slight delay in the refresh process.
    const dispatch = useDispatch();
    const city = useSelector(store => store.city);

    const params = useParams();
    const id = params.cityId;

    useEffect(() => {
        dispatch({type: 'FETCH_CITY', payload: {id}});
    }, []);


    return (
        <div className="cityContainer">
            <h2>{city[0]?.city}</h2>
            <h3>Faction: {city[0]?.type}</h3>
            <h3>Zone: {city[0]?.zone}</h3>
            <img src={city[0]?.map_image_url} />
            <p>{city[0]?.description}</p>
        </div>
    );
}


export default CityPage;